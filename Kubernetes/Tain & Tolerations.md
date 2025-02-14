# Kubernetes Taints & Tolerations

Kubernetes에서 `Taints`와 `Tolerations`는 특정 노드에서 특정 파드를 스케줄링할 수 있도록 제어하는 메커니즘입니다.

## 1. Taints란?
`Taint`는 노드에 설정되는 속성으로, 해당 노드에 특정한 조건이 충족되지 않는 파드가 스케줄링되지 않도록 방지합니다.

### Taint 형식
```shell
kubectl taint nodes <노드이름> key=value:effect
```
- **key**: Taint의 키
- **value**: Taint의 값 (선택 사항)
- **effect**: Taint의 동작 방식
  - `NoSchedule` : 해당 노드에는 Toleration이 없는 파드는 스케줄링되지 않음
  - `PreferNoSchedule` : 가능하면 해당 노드에 스케줄링하지 않지만, 강제는 아님
  - `NoExecute` : Toleration이 없는 기존 파드는 즉시 제거됨

### 예제
```shell
kubectl taint nodes node1 key1=value1:NoSchedule
```
위 명령어는 `node1`에 `key1=value1`의 `NoSchedule` 효과를 가진 Taint를 추가합니다.

## 2. Tolerations란?
`Tolerations`는 특정 파드가 특정 Taint가 적용된 노드에서도 실행될 수 있도록 허용하는 속성입니다.

### Toleration 형식 (YAML)
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  tolerations:
  - key: "key1"
    operator: "Equal"
    value: "value1"
    effect: "NoSchedule"
```

- **key**: Taint의 키
- **operator**:
  - `Equal` : key-value가 일치해야 함
  - `Exists` : key만 일치하면 됨 (value 불필요)
- **value**: Taint 값
- **effect**: Taint 효과 (`NoSchedule`, `PreferNoSchedule`, `NoExecute`)

## 3. Taints & Tolerations 사용 예제

### (1) 특정 노드에만 특정 파드를 배치하기
1. `node1`에 Taint 추가
   ```shell
   kubectl taint nodes node1 dedicated=special:NoSchedule
   ```
2. 특정 파드가 `node1`에서 실행될 수 있도록 Toleration 추가
   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: special-pod
   spec:
     tolerations:
     - key: "dedicated"
       operator: "Equal"
       value: "special"
       effect: "NoSchedule"
   ```

### (2) 특정 파드를 특정 노드에서 제거하기
1. `node2`에 `NoExecute` Taint 추가
   ```shell
   kubectl taint nodes node2 critical=true:NoExecute
   ```
2. `NoExecute` Taint를 무시할 수 없는 파드는 해당 노드에서 제거됨

## 4. Taints & Tolerations vs Node Selector / Affinity
| 기능 | Taints & Tolerations | Node Selector / Affinity |
|------|---------------------|-------------------------|
| 역할 | 파드 제한 | 파드 배치 |
| 강제성 | 강제적 (`NoSchedule`, `NoExecute`) | 소프트 제한 가능 (`preferredDuringSchedulingIgnoredDuringExecution`) |
| 적용 대상 | 노드가 파드를 거부 | 파드가 노드를 선택 |

## 5. 정리
- `Taints`는 특정 노드에서 특정 파드가 실행되지 않도록 제한하는 역할을 함
- `Tolerations`는 특정 파드가 해당 제한을 무시하고 실행될 수 있도록 허용함
- `Taints & Tolerations`는 주로 노드 격리 및 특정 워크로드를 위한 환경 구성에 사용됨

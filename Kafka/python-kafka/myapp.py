#!/bin/python
import faust

class Test(faust.Record):
    msg: str
    
app = faust.App('myapp', broker = '')
topic = app.topic('python.test', value_type = Test)

@app.agent(topic)
async def hello(messages):
    async for message in messages:
        print(f'Received {message.msg}')

@app.timer(interval = 5.0)
async def example_sender():
    await hello.send(
        value = Test(msg = 'Hello World!!'),
    )

if __name__ == '__main__':
    app.main()

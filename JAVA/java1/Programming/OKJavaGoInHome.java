import org.opentutorials.iot.Security;
import org.opentutorials.iot.Elevator;
import org.opentutorials.iot.Lighting;

public class OKJavaGoInHome {

	public static void main(String[] args) {
		
		String id = "JAVA APT 507"
		
		// Elevator call
		Elevator myElevator = new Elevator("id"); // Elevator
		myElevator.callForUp(1); // ø§∏Æ∫£¿Ã≈Õ∏¶ 1√˛¿∏∑Œ ∫∏≥Ω¥Ÿ
		
		// Security off
		Security mySecurity = new Security("id");
		mySecurity.off(); // ≤Ù±‚
		
		// Light on
		Lighting hallLamp = new Lighting(id + " / HallLamp");
		hallLamp.on();
		
		Lighting floorLamp = new Lighting(id + " / floorLamp");
		floorLamp.on();
	}

}

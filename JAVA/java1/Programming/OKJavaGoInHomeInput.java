import javax.swing.JOptionPane;

import org.opentutorials.iot.Security;
import org.opentutorials.iot.DimmingLights;
import org.opentutorials.iot.Elevator;
import org.opentutorials.iot.Lighting;

public class OKJavaGoInHomeInput {

	public static void main(String[] args) {
		
		String id = JOptionPane.showInputDialog("Enter a ID");
		String bright = JOptionPane.showInputDialog("Enter a Bright Level");
		
		// Elevator call
		Elevator myElevator = new Elevator(id); // Elevator
		myElevator.callForUp(1); // ø§∏Æ∫£¿Ã≈Õ∏¶ 1√˛¿∏∑Œ ∫∏≥Ω¥Ÿ
		
		// Security off
		Security mySecurity = new Security(id);
		mySecurity.off(); // ≤Ù±‚
		
		// Light on
		Lighting hallLamp = new Lighting(id + " / HallLamp");
		hallLamp.on();
		
		Lighting floorLamp = new Lighting(id + " / floorLamp");
		floorLamp.on();
		
		DimmingLights moodLamp = new DimmingLights(id + " moodLamp");
		moodLamp.setBright(Double.parseDouble(bright));
		moodLamp.on();
		
	}

}

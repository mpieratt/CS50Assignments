using System.Collections;
using UnityEngine;

public class Gem : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

		// despawn when past left edge of the screen (camera)
		if (transform.position.x < -25) { 
			Destroy(gameObject);
		}
		else {
			// ensure gem moves at the same rate as the skyscrapper do 
			transform.Translate(-SkyscraperSpawner.speed * Time.deltaTime, 0, 0, Space.World);
		}
		
		// infinitely roate this coin about the X and Y in world space 
		transform.Rotate(5f, 5f, 0, Space.World);
	}

	
	void OnTriggerEnter(Collider other) {

		// trigger gem pickup function if a helicopter collides with this
		other.transform.parent.GetComponent<HeliController>().PickupGem();
		Destroy(gameObject);
	}
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Despawn : MonoBehaviour {

	public GameObject characterController;


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		float playerY = 
			characterController.transform.position.y;

		if (playerY + 1.8 < 0.8 ) {
			PlayerStats.level = 1;
			SceneManager.LoadScene("GameOver");
		}
	}

}

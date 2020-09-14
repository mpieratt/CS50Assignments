using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GemSpawner : MonoBehaviour {

	public GameObject[] prefabs;

	// Use this for initialization
	void Start () {
		
		// aysnchrous infinite skyscarper spawning
		StartCoroutine(SpawnGem());
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	IEnumerator SpawnGem() {
		while (true) {

			// create a new gem from prefab selection at right edge of screen 
			Instantiate(prefabs[Random.Range(0, prefabs.Length)], new Vector3(26, Random.Range(-10, 10), 10), 
			Quaternion.identity);

			yield return new WaitForSeconds(Random.Range(5, 10));
		}
	}
}

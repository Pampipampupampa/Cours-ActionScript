//On commence toujours l'arboresence de cette façon en déclarant le chemin du fichier à compiler si on est pas dans le programme principal (le séparateur de dossier est le "." et non le "/" ou le "\")
//exemple : package Doc.Doc2 (ici on va cherche le fichier contenu dans au chemin Source/Doc/Doc2)
package {
	
	//On importe ici des fichier qui nous seront utiles
	// Les imports de fichier flash commencent toujours par "flash"
	// les imports de fichier fait soi-même demandent le chemin du fichier (ex : Doc.Doc.fichier)
	import flash.display.Sprite;

	//Ici on va importer une classe (correspond au nom du fichier). Celui-ci doit toujours commencer par une majuscule (donc tous les fichier .as devront être débutés par une majuscule)
	// Il doit aussi avoir des accolades en aval de l'importation
	public class Hello extends  Sprite {
		//Ici on déclare une fonction (on déclare la fonction obligatoire : le constructeur)
		public function Hello() {
			/* Ici on a créer 
			un commentaire 
			sur plusieurs lignes
			Il faut bien ouvrir et fermer
			le commentaire */

			trace("Hello World !!");

		}

	}
}
var forms = {
	login: "zhars"
}

var total_erreur = 0;

function Check() {
	var tabc = Check.arguments;
	var ok = 0;
	var tab = "                   azertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBN0123456789_$&#@";
	for (var no=0;no<tabc.length;no++) {
		checksum = tabc[no];

		var login = forms.login;
		var password = "souris";
		var nblog = login.length;
		var nbpass = password.length;
		var sum = 1;
		var n = Math.max(nblog,nbpass)

		console.log("n = " + n)

		for (var i = 0; i < n; i++) {
			console.log("---")
			console.log("")
			var index1 = tab.indexOf(login.substring(i,i + 1)) + 10;
			var index2 = tab.indexOf(password.substring(i,i+ 1 )) + 10;
			console.log(index1, index2)

			sum = sum + (index1 * n * (i + 1)) * (index2 * (i + 1) * (i + 1));
			if (checksum > sum) {
				console.log("checksum > sum : " + checksum + " > " + sum)
			} else if (checksum < sum) {
				console.log("checksum < sum : " + checksum + " < " + sum)
			} else {
				console.log("checksum = sum : " + checksum + " =" + sum)
			}
			console.log("")
		}

    if (sum==checksum) {
			console.log("/epreuves/javascript/"+login+".php");
			ok=1;
			no=100;
		}

	}
	if (ok==0) {
		total_erreur++;
		console.log("Mauvais login ou mot de passe");
		if (total_erreur>2) {
			console.log("Vous avez atteint les 3 essais !\nAu revoir");
		}
	}
}
function Verifie() {
	Check(3696619)
}

Verifie()
	
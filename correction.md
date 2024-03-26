Le contrat est rempli, très bon travail bravo

Attention ton fichier variables.tf est vide pourquoi le garder dans ce cas. Ou déplace la déclaration de la var ec2s dedans.
Attention l'invocation de la lambda doit se faire à chaque déploiement, pas uniquement en cliquant sur "test" dans l'interface de lambda.
Pour cela tu peux utiliser "lambda_invoke_function".


Note : 18.5 / 20
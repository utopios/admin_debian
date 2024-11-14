## Exercice : Diagnostic de problèmes réseau

**Objectif :**

Utiliser les outils de diagnostic réseau pour identifier et résoudre un problème de connectivité.

**Scénario :**

Vous constatez que votre machine Debian 12 ne parvient pas à accéder à Internet, bien que la configuration réseau semble correcte.

Instructions :
	1.	Tâches à réaliser :
a. Utilisez ping pour tester la connectivité vers :
	•	Votre propre adresse IP.
	•	La passerelle par défaut.
	•	Une adresse IP externe connue (par exemple, 8.8.8.8).
b. Utilisez traceroute pour déterminer où le trafic est bloqué lors de la tentative d’accès à une adresse externe.
c. Vérifiez les configurations DNS en utilisant nslookup ou dig pour résoudre www.example.com.
d. Utilisez netstat ou ss pour vérifier les connexions réseau actives et les ports en écoute.
e. Consultez la table de routage avec ip route show pour vérifier les routes configurées.
	2.	Résolution :
	•	Identifiez la cause probable du problème.
	•	Proposez une solution pour rétablir la connectivité Internet.
	3.	Questions de réflexion :
	•	Comment les outils de diagnostic peuvent-ils aider à résoudre les problèmes réseau ?
	•	Quelles sont les étapes logiques pour isoler un problème de connectivité ?
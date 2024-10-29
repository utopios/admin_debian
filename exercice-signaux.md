

### Exercice : Manipulation des Signaux de Processus

**Objectif**: Expérimenter l’utilisation des signaux pour gérer des processus sous Linux.

1.	Lancer un Processus
    - Démarrez un processus en arrière-plan en utilisant une boucle for pour qu’il compte de 1 à 100 avec une pause d’une seconde entre chaque nombre.
    ```bash
    for i in {1..100}; do echo $i; sleep 1; done &
    ```
    - Notez le PID de ce processus.
2.	Suspendre le Processus
    - Envoyez un signal pour suspendre temporairement le processus.
3.	Reprendre le Processus
    - Envoyez un signal pour reprendre le processus suspendu.
4.	Envoyer un Signal de Rechargement
    - Envoyez un signal permettant de recharger la configuration du processus.
5.	Arrêter le Processus de Façon Gracieuse
    - Utilisez un signal pour arrêter le processus de manière contrôlée.
6.	Forcer l’Arrêt du Processus
    - Relancez le processus et utilisez un signal pour le forcer à s’arrêter immédiatement.

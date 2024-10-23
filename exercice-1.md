### Exercice : Maîtrise avancée des montages avec `fstab`

#### Objectif :
Configurer divers montages de systèmes de fichiers locaux et virtuels en utilisant `fstab` et explorer les options avancées de montage, de performance et de sécurité.

---

### Tâches à réaliser :

1. **Montage d’un disque en ext4 avec optimisation des performances :**
   - Montez un disque local formaté en ext4.
   - Configurez-le dans `/etc/fstab` avec des options qui optimisent les performances (désactivation de `atime`, `nodiratime`).
   - Vérifiez le comportement du système après redémarrage.

2. **Montage d’un disque en lecture seule :**
   - Montez un autre disque local en lecture seule, via `/etc/fstab`.
   - Assurez-vous que même les utilisateurs avec des privilèges root ne puissent pas remonter ce disque en écriture sans modifier `fstab`.
   - Testez en essayant d'écrire sur ce disque.

3. **Système de fichiers virtuel `tmpfs` pour les fichiers temporaires :**
   - Créez et configurez un point de montage pour `tmpfs` dans `/etc/fstab`, avec une limite de taille (par exemple 1 Go).
   - Montez ce système de fichiers en mémoire pour stocker les fichiers temporaires.
   - Assurez-vous qu'il soit monté automatiquement au démarrage et qu'il respecte les limitations de taille.

4. **Utilisation de quotas sur un disque monté (package quota) :**
   - Montez un disque local via `/etc/fstab` en activant les quotas utilisateurs.
   - Configurez des quotas pour limiter l'espace disque utilisé par chaque utilisateur.
   - Vérifiez que les quotas fonctionnent correctement lorsque vous essayez d'écrire des données sur le disque avec différents utilisateurs.


5. **Gestion avancée des permissions sur un disque partagé :**
   - Montez un disque local via `/etc/fstab` en configurant les options de montage (`uid`, `gid`) pour qu’un groupe spécifique d’utilisateurs ait des droits de lecture et d’écriture.
   - Vérifiez que les permissions fonctionnent comme prévu pour les utilisateurs appartenant à ce groupe.


# Partie 1
1. Créer des utilisateurs
```bash
sudo useradd -u 1501 -m jean
sudo useradd -u 1502 -m marie
```

2. Créer les groupes 
```bash
sudo groupadd admin
sudo groupadd support

sudo usermod -aG admin jean
sudo usermod -aG support marie
```

3. Vérification
```bash
grep jean /etc/passwd
grep marie /etc/passwd

grep admin /etc/group
grep support /etc/group
```

# Partie 2

1. Configurer PAM pour sha-512

```bash
sudo grep -q 'password [success=1 default=ignore] pam_unix.so obscure sha512' /etc/pam.d/common-password || echo 'password [success=1 default=ignore] pam_unix.so obscure sha512' >> /etc/pam.d/common-password

passwd jean

sudo grep jean /etc/passwd # => $6$
```

# Partie 3

```bash
sudo nano /home/jean/.bashrc
```

- Ajouter ```alias ll='ls -la'```


```bash
sudo bash -c 'echo "export EDITOR=nano" >> /home/marie/.bash_profile'
```

- Vérification
```bash
su - jean
ll

su - marie
echo $EDITOR
```

# Partie 4
1. **Analyse des fichiers :**

   - **/etc/passwd** : Contient les informations des utilisateurs, leur UID, GID, shell, et répertoire personnel. Il est lisible par tous les utilisateurs, donc des informations comme le nom d’utilisateur peuvent être exposées.
     - **Risque** : Enumération d’utilisateurs par des attaquants. Si un UID est mal configuré (par ex., 0 pour un utilisateur non root), cela peut donner des droits root.

   - **/etc/shadow** : Contient les mots de passe chiffrés. Accès limité à `root`. Utilise SHA-512 pour hacher les mots de passe.
     - **Risque** : Si des utilisateurs non autorisés accèdent à ce fichier (par une faille), ils pourraient tenter de casser les mots de passe. Assurez-vous que les permissions sont strictes (`chmod 640`).

   - **/etc/group** : Liste les groupes et leurs membres. Il est aussi lisible par tous les utilisateurs, donc des informations sur les groupes peuvent être exposées.
     - **Risque** : Enumération des groupes par un attaquant pour cibler des groupes sensibles.

2. **Bonnes pratiques de sécurisation :**
   - Utiliser un chiffrement moderne (SHA-512).
   - Restreindre les accès aux fichiers sensibles : `/etc/shadow` doit être accessible uniquement par root.
   - Limiter l'utilisation des comptes `root` avec `sudo` pour une traçabilité.

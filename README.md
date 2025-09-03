# Homelab
Repository homelab, docker-compose, scripts de configs, explications...
Ce homelab est virtualisé sur Proxmox, + de détails seront ajoutés dans la documentation au fur-et-à-mesure de ma progression.
Les containers dockers sont gérés par Portainer.

## Services :
### Photos

Deux Immich (*Immich et Immich-2*) sont mis en places en container, chacun ayant ses volumes et son port.

Les fichiers '''docker-compose.yml''' sont paramétrés pour **mon matériel** et permettent l'accélération graphique et ML sur un GPU Intel. 
Par ailleurs, ces fichiers sont complétés par les sections correspondantes des fichiers à propos de l'accélération provenant de la [documentation Immich](https://immich.app/docs/overview/welcome).

## À faire :

- [x] Création du repo github
- [x] Mise en place du premier Immich
- [ ] Mise en place du deuxième Immich
- [ ] Mise en place d'un stack *arr

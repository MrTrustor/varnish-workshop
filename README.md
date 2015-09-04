# Oxalide Workshop #2

## Contenu

 * ESI/Ajax, du dynamique dans du statique
 * Vmods principaux et leur utilite
 * Cache hierarchique
 * Partage de cache entre plusieurs Varnish

## Notes

 * le user vagrant a tous les droits via sudo

## Exercice
Utiliser le vmod vsthrottle (deja installe) pour limiter le nombre de requete d'utilisateurs non connectes.
Tips: les sessions sont stockees dans Memcached.

## Solution
On recupere l'ID de session, puis on interroge memcached via le vmod-memcached pour savoir si la session existe.

## References
 * Vmod vsthrottle : <https://github.com/varnish/libvmod-vsthrottle>
 * Liste des vmods pour Varnish 4 : <https://www.varnish-cache.org/vmods?field_vmod_status_value=All&term_node_tid_depth=18&keys=>
 * Memcached protocole : <https://github.com/memcached/memcached/blob/master/doc/protocol.txt>

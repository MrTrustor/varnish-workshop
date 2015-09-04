# Oxalide Workshop #2

## Contenu

 * ESI/Ajax, du dynamique dans du statique
 * Vmods principaux et leur utilite
 * Cache hierarchique
 * Partage de cache entre plusieurs Varnish

## Notes

 * Le user vagrant a tous les droits via sudo

## Explications
 * Deux Varnish tournent (ports 80 et 81),
 * Le Varnish "Up" (port 81) a pour backend le Varnish "Low" (port 80),
 * Le Varnish "Low" a pour backend Apache,
 * Avant de donner des objets au Varnish Up, le Varnish Low divise les TTL par deux,
 * Observer les headers Age-Low, Age-Up, X-Cache-Low, X-Cache-Up, Cache-Control et Expires.

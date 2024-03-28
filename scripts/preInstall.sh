#set env vars
#set -o allexport; source .env; set +o allexport;

mkdir -p ./consume/;
mkdir -p ./data/;
mkdir -p ./export/;
mkdir -p ./media/;


chown 1000:1000 ./consume/
chown 1000:1000 ./data/
chown 1000:1000 ./export/
chown 1000:1000 ./media/

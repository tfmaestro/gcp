#!/bin/bash

echo "Aktualizacja pakietów"
apt-get update -y

echo "Instalacja narzędzi do analizy sieci"
apt-get install -y net-tools

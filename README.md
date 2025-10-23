# tofu

**Attenzione: questo progetto è solo un Proof of Concept (POC).**

Questo progetto utilizza [OpenTofu](https://opentofu.org/) per la gestione dell'infrastruttura come codice.

## Struttura del progetto

- `main.tf`: configurazione principale di OpenTofu/Terraform.
- `files.tf`: gestione di file statici.
- `nginx.tf`: provisioning e configurazione di Nginx.
- `postgres.tf`: provisioning e configurazione di PostgreSQL.
- `outputs.tf`: definizione degli output.
- `variables.tf`: dichiarazione delle variabili.
- `secrets.tfvars`: variabili sensibili (non versionare in git).
- `terraform.tfstate`, `terraform.tfstate.backup`: file di stato di OpenTofu/Terraform.
- `site/`: directory contenente file statici del sito.
  - `index.html`: pagina principale.
- `templates/`: template per la generazione di file.
  - `index.html.tftpl`: template per la pagina principale.

## Prerequisiti

- [OpenTofu](https://opentofu.org/) installato
- Accesso alle credenziali necessarie per il provisioning

## Utilizzo

1. Inizializza la directory:
   ```sh
   tofu init
   ```
2. Applica la configurazione:
   ```sh
   tofu apply -var-file=secrets.tfvars
   ```

## Note
- Non committare `secrets.tfvars` e i file di stato.
- Personalizza le variabili in `variables.tf` e i template secondo le tue esigenze.

## Licenza
Questo progetto è distribuito con licenza MIT.
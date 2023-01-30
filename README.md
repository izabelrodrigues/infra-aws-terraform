# Infraestrutura AWS com Terraform

## Requisitos

- Aws Cli instalado e configurado com um usuario que executa comandos: <br/>
  [Instruções para instalação](hhttps://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-getting-started.html) <br/>
  [Instruções para configuração](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html)
- Terraform instalado: <br/>
  [Instruções para instalação](https://developer.hashicorp.com/terraform/downloads)

## Como usar

- Abra o arquivo main.tf e informe a localização dos arquivos config e credentials

- Na raiz do seu projeto execute os comandos abaixo

```bash
terraform init
terraform apply
```

## Outputs

- commands_ssh_per_instance: Lista com comando para acessar um diretorio anterior ao do codigo e executar a conexao ssh com a instancia criada <br/>
- instances_id: ids das instancias criadas <br/>
- public_ips: public ips das instancias criadas <br/>

## Arquitetura criada após a execução

## Como acessar as máquinas via ssh

- Copie a saida do output commands_ssh_per_instance que contem a instancia desejada e execute o comando via bash para conectar na instancia via ssh

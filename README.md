# Infraestrutura AWS com Terraform
**atenção o código é uma demonstração. Não use a liberação de acesso para as portas usando all trafic em um ambiente produtivo.

## Requisitos

- Aws Cli instalado e configurado com um usuario que executa comandos: <br/>
  [Instruções para instalação](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-getting-started.html) <br/>
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

- alb_url: Endereço do load balancer
- commands_ssh_per_instance: Lista com comando para acessar um diretorio anterior ao do codigo e executar a conexao ssh com a instancia criada <br/>
- instances_id: ids das instancias criadas <br/>
- public_ips: public ips das instancias criadas <br/>
![image](https://user-images.githubusercontent.com/3687713/216229841-c01cdb16-8cd7-404b-b634-d7fd56a413a1.png)


## Arquitetura criada após a execução
![infra-terraform drawio](https://user-images.githubusercontent.com/3687713/216229607-35080849-542c-4731-9726-6b511e077a4e.png)

## Como acessar as máquinas via ssh

- Copie a saida do output commands_ssh_per_instance que contem a instancia desejada e execute o comando via bash para conectar na instancia via ssh

![image](https://user-images.githubusercontent.com/3687713/216229991-44e50d4e-4e93-4e5e-864a-eaa4a4fe6a0e.png)

## Exemplo de acesso pelo Load Balancer
![image](https://user-images.githubusercontent.com/3687713/216229701-2a242c46-e5a1-4d40-883a-620d5e1010ce.png)

## Documentação de referência
- [Terraform](https://registry.terraform.io/)
- [AWS Cli](https://docs.aws.amazon.com/pt_br/cli/index.html)

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
![saida_outputs](https://user-images.githubusercontent.com/3687713/215537833-459d99f2-37de-43dd-89d4-954d124d26fd.jpg)

## Arquitetura criada após a execução
![infra-terraform](https://user-images.githubusercontent.com/3687713/215537604-a9f84c44-6271-471e-af55-c3f7e770cd9c.png)

## Como acessar as máquinas via ssh

- Copie a saida do output commands_ssh_per_instance que contem a instancia desejada e execute o comando via bash para conectar na instancia via ssh

![exemplo-conexao](https://user-images.githubusercontent.com/3687713/215538016-d105c1b2-9c4f-4281-b9a6-6b0c1309795a.jpg)

## Exemplo de uma das instâncias em execução
![exemplo-ngix-uma-instancia](https://user-images.githubusercontent.com/3687713/215538363-cb461616-b4e0-401a-b9de-489f07a061a1.jpg)

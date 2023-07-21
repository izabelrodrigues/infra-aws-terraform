data "aws_ssm_parameters_by_path" "tg" {
  path = "/tg-id-alb"
}


output "instances_id" {
  description = "ids das instancias criadas"
  value       = [module.ec2_multiple["one"].id, module.ec2_multiple["two"].id]
}

output "public_ips" {
  description = "public ips das instancias criadas"
  value       = [module.ec2_multiple["one"].public_ip, module.ec2_multiple["two"].public_ip]
}

output "commands_ssh_per_instance" {
  description = "Lista com comando para acessar um diretorio anterior ao do codigo e executar a conexao ssh com a instancia criada"
  value = [join(" ", ["ssh -i", "../'${aws_key_pair.key_intensivao.key_name}.pem'", "ec2-user@${module.ec2_multiple["one"].public_dns}"]),
  join(" ", ["ssh -i", "../'${aws_key_pair.key_intensivao.key_name}.pem'", "ec2-user@${module.ec2_multiple["two"].public_dns}"])]
}

output "alb_url" {
  description = "endereço alb"
  value       = module.alb.lb_dns_name
}

output "parametro" {
  description = "value"
  value       = data.aws_ssm_parameters_by_path.tg.path
  sensitive   = true
}


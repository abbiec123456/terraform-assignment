output "web_instance_ids" {
  value = [for inst in aws_instance.web : inst.id]
}

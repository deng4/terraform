locals {
  sentence = "The quick brown fox jumps over the lazy dog."
  modified_sentence = replace(local.sentence, "fox", "cat")
  final_sentence = replace(local.modified_sentence, "dog", "mouse")
}

output "example2" {
  value = local.final_sentence
}

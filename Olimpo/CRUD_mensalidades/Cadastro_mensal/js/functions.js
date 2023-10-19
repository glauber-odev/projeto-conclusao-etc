function mascara_cpf(){
    var cpf = document.getElementById('cpf')
    if(cpf.value.length == 3 || cpf.value.length == 7) {
        cpf.value += "."
    } else if(cpf.value.length == 11){
        cpf.value += "-"
    }
}




function mascara_cartao(){
    var num_cartao = document.getElementById('num_cartao')
    if(num_cartao.value.length == 4 || num_cartao.value.length == 9 || num_cartao.value.length == 14) {
        num_cartao.value += " "
}
}




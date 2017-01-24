function sendProduct(id){
    var quantidade = document.getElementsByName('quantidade')[0].value;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'Venda', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        // do something to response
        console.log(this.responseText);
    };
    xhr.send('acao=ADDProduto&id='+id+'quantidade='+quantidade);
};

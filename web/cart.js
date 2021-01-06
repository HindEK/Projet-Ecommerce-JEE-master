function onQuantityChange(newQuantity, id)
{
    
    $.get("/SiteEcommerceJeeWeb/cart/modifyQuantity?productId=" + id.substring(15) + "&quantity=" + newQuantity, function(data, status){
        console.log(data);
        if(data.modified === false)
        {
            console.log(data);
            alert("La quantité que vous demandez n'est pas disponible !");
        }
  });
}
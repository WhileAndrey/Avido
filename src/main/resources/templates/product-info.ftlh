<!DOCTYPE html>

<html lang="eng">
<head>
    <title>Avido</title>
</head>
<body>
<H1>Avido</H1><hr>
<h4>Подробная информация о товаре</h4>

<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>


<b>Название </b>${product.title}<br>
<b>Описание </b>${product.description}<br>
<b>Цена </b>${product.price}<br>
<b>Город </b>${product.city}<br>
<b>Автор </b><a href="/user/${product.user.id}">${product.user.name}</a><br>
<hr>
<button onclick="history.back()">Назад</button>
</body>
</html>

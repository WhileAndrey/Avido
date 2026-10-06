<!DOCTYPE html>
<html>
<head>
    <title>AVIDO</title>
</head>
<body>
<h1>AVIDO</h1><hr>
<h3>Подробная информация о пользователе</h3>
<b>Имя: </b> ${user.name}<br>
<b>Номер телефона: </b> ${user.numberPhone}<br>

<h4>Товары пользователя ${user.name}</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб.| <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>
<button onclick="history.back()">Назад</button>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>

</body>
</html>
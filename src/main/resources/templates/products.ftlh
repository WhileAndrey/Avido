<!DOCTYPE html>
<html lang="en">
<head>
    <title>Avido</title>
</head>
<body>
<h1>Avido</h1>
<hr>

<#if user?? && user.email??>
    <h3>Привет, <i>${user.name!""}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <br>

    <#assign isAdmin = false>
    <#if user.roles??>
        <#list user.roles as r>
            <#if r?string == "ROLE_ADMIN">
                <#assign isAdmin = true>
            </#if>
        </#list>
    </#if>

    <#if isAdmin>
        <a href="/admin">В меню администратора</a>
    </#if>

<#else>
    <a href="/login">Войти</a>
</#if>

<hr>
<h4>Товары со всей России</h4>

<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>

<#-- ===== СПИСОК ТОВАРОВ ===== -->
<#if products?? && products?size gt 0>
    <#list products as product>
        <div>
            <p>
                <b>${product.title}</b> ${product.price} руб. |
                <a href="/product/${product.id}">Подробнее...</a>
            </p>
        </div>
    </#list>
<#else>
    <h3>Товаров нет</h3>
</#if>

<#if user?? && user.email??>
    <hr>
    <h3>Создать новый товар</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Название объявления: <input type="text" name="title"/><br><br>
        Описание объявления: <input type="text" name="description"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        Город: <input type="text" name="city"/><br><br>
        Первое фото: <input type="file" name="file1"/><br><br>
        Второе фото: <input type="file" name="file2"/><br><br>
        Третье фото: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар"/><br><br>
    </form>
</#if>

</body>
</html>
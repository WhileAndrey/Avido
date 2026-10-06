<!DOCTYPE html>

<html lang="eng">
<head>
    <title>Avido</title>
</head>
<body>
<H1>Avido </H1><hr>
<h4>Панель администратора</h4>


<table border="1">
    <tr>
        <th>Email</th>
        <th>Number Phone</th>
        <th>Is Active</th>
        <th>Role</th>
        <th>Is Ban</th>
        <th>Change</th>
        <th>Detail</th>
    </tr>

    <#if users?? && users?size gt 0>
        <#list users as user>
            <tr>
                <td>${user.email!""}</td>
                <td>${user.numberPhone!""}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td>
                    <#list user.roles as role>
                        ${role}<#sep>,
                    </#list>
                </td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Ban">
                    </form>
                </td>
                <td><a href="/admin/user/edit/${user.id}">change</a></td>
                <td><a href="/user/${user.id}">More Info</a></td>
            </tr>
        </#list>
    <#else>
        <tr>
            <td colspan="7"><h3>Пользователей нет</h3></td>
        </tr>
    </#if>
</table>
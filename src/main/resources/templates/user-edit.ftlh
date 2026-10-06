<!DOCTYPE html>
<html>
    <head><title>AVIDO</title></head>
    <body>
    <H1>AVIDO</H1>
    <h3>Редактирование пользователя</h3>
    <form action="/admin/user/edit" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>
    <br>
    <button onclick="history.back()">Назад</button>
    </body>

</html>
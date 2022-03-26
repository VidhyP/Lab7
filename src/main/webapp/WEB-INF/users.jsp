<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h1>User Management System</h1>
            <div class="row">
                <div class="col">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Role</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.role.name}</td>
                                    <td>${user.active ? "Yes" : "No" }</td>
                                    <td>
                                        <a href="users?action=edit&email=${user.email}">Edit</a>
                                        <a href="users?action=delete&email=${user.email}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <form method="POST" action="users">
                <h4>Add a user</h4>
                <input type="hidden" name="action" value="add">
                <div>
                    <label for="email">Email: </label> 
                    <input type="email" name="email" required>
                </div>
                <div>
                    <label for="fname">First Name: </label> 
                    <input type="text" name="fname" required>
                </div>
                <div>
                    <label for="lname">Last Name: </label> 
                    <input type="text" name="lname" required>
                </div>
                <div>
                    <label for="password">Password: </label> 
                    <input type="password" name="passwd" required>
                </div>
                <div>
                    <label>User Role:</label>
                    <select name="role">
                        <option value="regular user">regular user</option>
                        <option value="system admin">system admin</option>
                        <option value="company admin">company admin</option>
                    </select>
                </div>
                <button type="submit">Add</button>
            </form>
            <br>
            <form method="POST" action="users">
                <h4>Edit a user</h4>
                <input type="hidden" name="action" value="edit">
                <div>
                    <label for="email">Email: </label> 
                    <input type="email" name="email" value="${user.email}" readonly>
                </div>
                <div>
                    <label for="fname">First Name: </label> 
                    <input type="text" name="fname" value="${user.firstName}" required>
                </div>
                <div>
                    <label for="lname">Last Name: </label> 
                    <input type="text" name="lname" value="${user.lastName}" required>
                </div>
                <div>
                    <label for="password">Password: </label> 
                    <input type="password" name="passwd" value="${user.password}" required>
                </div>
                <div>
                    <label>User Role:</label>
                    <select name="role">
                        <option value="regular user">regular user</option>
                        <option value="system admin">system admin</option>
                        <option value="company admin">company admin</option>
                    </select>
                </div>
                <button type="submit">Change</button>
            </form>
        </div>
    </body>
</html>

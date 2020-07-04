# README

To run this project follow these steps:
1. Add `config/application.yml` file. Use `/config/application.example.yml` file as an example.
2. Run `rails db:setup`
3. Run `rails s`

The app should be started on `localhost:3000`.

## Admins
### Roles
Each admin can has roles:
- `ui` role - access to admin dashboard
- `api` role - access to `api` endpoints
- `root` role - access to editing other admins on the dashboard

First admin has all roles by default.

### Creating admins
Admins can't register by themself.
First admin profile will be automatically created with the same email and password as first registered user.
Please note that admins have another endpoint for signing in:
- users: `/sign_in`
- admins: `/admin/sign_in`  

Other admins can be added only by `root admin` via dashboard.

### Dashboard
You can open admin dashboard on `/admin` endpoint. 
You should sign in before as an admin before it if not already.
Note that only admins with `ui` role can open into dashboard.

### Using API
To use API, firstly `api admin` should retrieve `access-token`, `client` and `uid` values. 
In order to retrieve them, admin should login using `api/v1/admin/auth/sign_in` endpoint. 
`access-token`, `client` and `uid` will be in response's headers.
Admin should add retrieved `access-token`, `client` and `uid` to headers of each request to app API.
More details on how it works you can find in [Devise Token Auth docs](https://devise-token-auth.gitbook.io/devise-token-auth/usage).
Exactly this gem was used to implement current logic.
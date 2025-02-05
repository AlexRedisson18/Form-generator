[![CI](https://github.com/AlexRedisson18/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/AlexRedisson18/rails-project-63/actions/workflows/main.yml)

[![hexlet-check](https://github.com/AlexRedisson18/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AlexRedisson18/rails-project-63/actions/workflows/hexlet-check.yml)

### Usage

Create class with required fields.
Then create inctance of the class with attributes

```ruby
User = Struct.new(:name, :job)
user = User.new name: 'John', job: 'driver'
```

Use HexletCode#form_for method to create form

```ruby
HexletCode.form_for user
```
returns:
```htm
<form action='#' method='post'>
</form>
```

You can pass fields with arguments within block

```ruby
HexletCode.form_for user do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text
  f.submit 'Wow!'
end
```
returns:
```htm
<form action='#' method='post'>
  <label for='name'>Name</label>
  <input name='name' type='text' value='John' class='user-input'>
  <label for='job'>Job</label>
  <textarea name='job' cols='20' rows='40'>driver</textarea>
  <input type='submit' value='Wow!'>
</form>
```

Also you can pass attributes for form:
```ruby
HexletCode.form_for user, url: '/users', method: :delete, class: 'user-form' do |f|
  f.input :name
  f.submit
end
```
returns:
```htm
<form action='/users' class='user-form' method='delete'>
  <label for='name'>Name</label>
  <input name='name' type='text' value='John'>
  <input type='submit' value='save'>
</form>
```

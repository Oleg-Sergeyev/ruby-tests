
# language: ru

Функционал: проверяем методы класса User
  Создайте класс пользователя User, объект которого сможет хранить:
  фамилию, имя, отчество пользователя, а также его электронный адрес

  Сценарий: пусть класс сообщит электронный адрес пользователя
    Допустим дан объект класса User
    Если я вызываю его метод email
    То получаю электронный адрес 'test@test.ru'

  Сценарий: пусть класс сообщит имя пользователя
    Допустим дан объект класса User
    Если я вызываю его метод first_name
    То получаю имя 'Тест'

  Сценарий: пусть класс сообщит фамилию пользователя
    Допустим дан объект класса User
    Если я вызываю его метод last_name
    То получаю фамилию 'Тестов'

  Сценарий: пусть класс сообщит отчество пользователя
    Допустим дан объект класса User
    Если я вызываю его метод middle_name
    То получаю отчество 'Тестович'
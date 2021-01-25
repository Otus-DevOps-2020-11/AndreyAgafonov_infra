# Выполнено ДЗ ansible-1 № 10

- [x] Основной задание
- [] Задание с *

## В процессе сделано:

- На основе преидущего задания - изменены задания и доработаны playbooks согласно методичук.
- Изменены образы Packer - созданы при поммощи packer
- Скорректрованиы плейбуки развертывания с учетом образов packer

## Как запустить проект:

 - Перейти в папку с  необходимым окружением terraform.(stage)
 - для проверки выполняем `terraform plan`
 - Если все ок - то применяем `terraform apply`
 - Правим ip адрес в инвентори ансибл:
    - до app и db в файле ./ansible/inventory
    - Внутренний адрес БД в файле ./ansible/app.yml
 - Из папки ansible запускаем `ansible-playbook site.yml`
 - На врешнем адресе app проверяем работоспособность приложения

## Как проверить работоспособность:
  - На врешнем адресе app проверяем работоспособность приложения

## PR checklist
 - [x] Выставил label с номером домашнего задания
 - [x] Выставил label с темой домашнего задания

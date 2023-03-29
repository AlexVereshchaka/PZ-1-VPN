# ОПИС

Данний Terraform код створює нову VPC з aws_vpc ресурсом, публічну підмережу з aws_subnet, інтернет-шлюз з aws_internet_gateway, маршрути з aws_route_table, прив'язує публічну підмережу до маршрутної таблиці з aws_route_table_association, групу безпеки з aws_security_group та активуєтьмя DNS-ім'я з aws_route53_record.

# СТРУКТУРА

 - main.tf - файл опису backend стану проекту та створення кошика для збереження terrafor.tfstate файлу
 - variable.tf - файл опису змінних у коді 
 - vpc.tf - файл опису мережевої інфраструктури

# ВИКОРИСТАННЯ

1. Завантажити репозиторій
2. Авторизувати обліковий запис AWS Cloud на локальному ПК за допомогою AWS CLI
3. Змінити файли variables.tf and main.tf на Ваші назви ресурсів
4. Ініціалізувати Terraform пакети за допомогою команди terraform init
5. Задеплоїти ресурси на AWS Cloude за допомогою команди terraform apply (або terraform apply --auto-approve)
6. Для видалення всієї інфраструктури клауду - terraform destroy

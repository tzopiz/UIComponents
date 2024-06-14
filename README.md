# UIComponents

Библиотека UIComponents предназначена для упрощения разработки пользовательского интерфейса в iOS приложениях, используя паттерн MVVM.

## Возможности

### BaseViewController

`BaseViewController` является базовым классом для создания контроллеров экранов с использованием шаблона MVVM. Он предоставляет основные методы для настройки, размещения и конфигурации визуальных элементов интерфейса. Класс поддерживает добавление кнопок на навигационную панель как слева, так и справа.

#### Особенности `BaseViewController`:

- **viewModel**: Связывает контроллер с соответствующей ViewModel.
- **presentHandler**: Обработчик для представления других контроллеров.
- **setupViews()**: Метод для настройки подвидов на контроллере.
- **layoutViews()**: Метод для установки ограничений для подвидов.
- **configureViews()**: Метод для настройки внешнего вида контроллера, таких как установка фона и других свойств визуальных элементов.

#### Дополнительные функции:

- **addNavBarButton(at:with:image:selector:)**: Добавляет кнопку на навигационную панель контроллера.

### `ViewModelNavigationDelegate`

Протокол `ViewModelNavigationDelegate` предоставляет методы для навигации между экранами, используя UINavigationController.

#### Методы `ViewModelNavigationDelegate`:

- **pushViewController(_:animated:)**: Помещает новый контроллер на стек навигации.
- **dismiss(animated:)**: Закрывает текущий контроллер, если он был открыт модально.
- **presentViewController(_:animated:)**: Открывает новый контроллер модально поверх текущего.

### BaseCollectionViewController

`BaseCollectionViewController` является базовым классом для создания контроллеров коллекций (UICollectionView) с использованием шаблона MVVM. Он предоставляет основные методы для настройки, размещения и конфигурации элементов коллекции.

#### Особенности BaseCollectionViewController:

- **viewModel**: Связывает контроллер с соответствующей ViewModel.
- **setupViews()**: Метод для настройки подвидов на контроллере коллекции.
- **layoutViews()**: Метод для установки ограничений для подвидов внутри контроллера.
- **configureViews()**: Метод для настройки внешнего вида контроллера коллекции, включая установку фона, цветов и других свойств визуальных элементов.
- **refreshData()**: Обновляет данные в коллекции, поддерживая возможность обновления через `UIRefreshControl`.
- **scrollToTop()**: Прокручивает коллекцию к верхнему элементу.

#### Методы UICollectionViewDataSource:

- **numberOfSections(in:)**: Возвращает количество секций в коллекции.
- **collectionView(_:numberOfItemsInSection:)**: Возвращает количество элементов в указанной секции.
- **collectionView(_:cellForItemAt:)**: Создает и возвращает ячейку для указанного индекса.

#### Методы UICollectionViewDelegateFlowLayout:

- **collectionView(_:layout:sizeForItemAt:)**: Устанавливает размер ячейки для элемента в коллекции.
- **collectionView(_:layout:insetForSectionAt:)**: Устанавливает отступы для секции коллекции.
- **collectionView(_:layout:minimumLineSpacingForSectionAt:)**: Устанавливает минимальный интерлинг для элементов в секции.

### TabBarController

`TabBarController` является базовой реализацией `UITabBarController` для приложений с несколькими экранами. Этот класс позволяет легко настраивать вкладки и управлять их отображением.

#### Особенности `TabBarController`:

- **Tab**: Структура, представляющая каждую вкладку на панели вкладок.
  - **title**: Название вкладки.
  - **image**: Изображение вкладки.
  - **selectedImage**: Изображение вкладки при выборе.
  - **viewController**: Контроллер представления, связанный с вкладкой.

- **switchTo(tab:)**: Метод для переключения на определённую вкладку по индексу.

- **configureAppearance(with:)**: Метод для настройки внешнего вида панели вкладок с предоставленными вкладками. Включает настройку цвета, фона и привязку контроллеров представления к вкладкам.

## Использование

Для использования библиотеки UIComponents в вашем проекте:

1. Импортируйте модуль UIComponents.
2. Наследуйтесь от `BaseViewController`, `BaseCollectionViewController` или `TabBarController` для создания ваших контроллеров экранов, коллекций или вкладок.
3. Реализуйте соответствующие ViewModel и используйте их для управления данными и бизнес-логикой ваших экранов.

## Пример

### BaseViewController

```swift
import UIComponents

class MyViewController: BaseViewController<MyViewModel> {
    // Здесь можно переопределить методы setupViews(), layoutViews(), configureViews() по необходимости
}
```

### BaseCollectionViewController

```swift
import UIComponents

class MyCollectionViewController: BaseCollectionViewController<MyCollectionViewModel, MyCollectionViewCell> {
    // Здесь можно переопределить методы setupViews(), layoutViews(), configureViews() по необходимости
}
```

### TabBarController

```swift
import UIComponents

class MyTabBarController: TabBarController {
    init() {
        let tabs = [
            Tab(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_selected"), viewController: HomeViewController()),
            Tab(title: "Settings", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings_selected"), viewController: SettingsViewController())
        ]
        super.init(tabs: tabs)
    }
}
```

---

Такой подход позволяет легко создавать и поддерживать модульные и легко тестируемые компоненты пользовательского интерфейса в вашем iOS приложении, соблюдая принципы чистой архитектуры MVVM.

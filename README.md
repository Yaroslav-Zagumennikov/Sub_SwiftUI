Для внедрения подписки в SwiftUI проект понадобится только папка Subscription

Код для управления подписками реализован через класс IAPManager_

- isLoadingProducts - пока загружается продукты
- boughtProducts - список купленных подписок

RechbilitY_ThorfinnApp -> Класс проверки интернета

Подписка на вход
```swift
import SwiftUI
@main
struct Sub_SwiftUIApp: App {
    @StateObject var reachability = RechbilitY_ThorfinnApp()
    @StateObject var iapManager = IAPManager_()
    private var subViewModel = SUBVM_ThorfinnApp(productType: .mainType)
    @State var isShown = true

    var body: some Scene {
        WindowGroup {
            if iapManager.isLoadingProducts {
                Color.black.ignoresSafeArea()
            } else if iapManager.boughtProducts.contains(.mainType) {
                // Здесь должна быть ваша первая страница
                // Обычно это Loading view
            } else {
                SubView_ThorFinnApp(subViewModel: subViewModel, isShown: $isShown)
                    .environmentObject(reachability)
                    .environmentObject(iapManager)
                    .transition(AnyTransition.asymmetric(insertion: AnyTransition.identity, removal: AnyTransition.move(edge: Edge.top)))
            }
        }
    }
}
```

https://github.com/Yaroslav-Zagumennikov/Sub_SwiftUI/assets/91648112/d3a05b41-e757-4476-ab1a-129915a4256b

Подписка на доп контент
Реализуется в виде вьюхи которая меняется в зависимости от статуса доп. подписки (кнопка или ссылка)

Для внедрения понадобится тип контента и переменная для проверки статуса оплаты доп. подписки

Тип контента
![Снимок экрана 2024-05-29 в 11 37 35 AM](https://github.com/Yaroslav-Zagumennikov/Sub_SwiftUI/assets/91648112/c749185e-a948-436b-9cae-3bc9486d128d)

Переменные для проверки (Находятся в классе IAPManager_)
![Снимок экрана 2024-05-29 в 11 46 26 AM](https://github.com/Yaroslav-Zagumennikov/Sub_SwiftUI/assets/91648112/260cd20e-9879-4191-8dad-9be4dcbf412d)

Во вьюхе меняете значение переменной "isShown"
```swift
isShown: $iapManager.isShown
```
Сама вьюха
```swift
// ModsScreen
logicButtonView(
//  access: iapManager.boughtProducts.contains("Тип контента"), isShown: $iapManager."Переменная для проверки"
    access: iapManager.boughtProducts.contains(.modsType), isShown: $iapManager.isShown,
    name: "Моды",
    linkButton:
        ContentSubView1()
        .navigationBarHidden(true)
)
.fullScreenCover(isPresented: $iapManager.isShown, content: {
//  SubView_ThorFinnApp(subViewModel: SUBVM_ThorfinnApp(productType: PrductTpe_ThorfinnApp."Тип контента"), isShown: $iapManager."Переменная для проверки")
    SubView_ThorFinnApp(subViewModel: SUBVM_ThorfinnApp(productType: PrductTpe_ThorfinnApp.modsType), isShown: $iapManager.isShown)
        .environmentObject(iapManager)
})
```

Код для работы вьюхи
```swift
struct logicButtonView<Destination: View>: View {
    var access: Bool
    @Binding var isShown: Bool
    var name: String
    var linkButton: Destination
    var body: some View {
        if access{
            NavigationLink {
                linkButton
            } label: {
                MenuButtonView(name: name, access: access)
            }

        } else {
            Button {
                isShown.toggle()
            } label: {
                MenuButtonView(name: name, access: access)
            }
        }
    }
}

struct MenuButtonView: View {
    var name: String
    let access: Bool
    var body: some View {
        VStack (spacing: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20){
            Text(name)
                .fontWeight(.semibold)
                .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 20 : 32 ))
        }
        .foregroundStyle(.white)
        .font(.headline)
        .frame(width: 100, height: 50)
        .padding()
        .background( Color(#colorLiteral(red: 0.4627384543, green: 0.5104349256, blue: 0.457896769, alpha: 1)))
        .cornerRadius(UIDevice.current.userInterfaceIdiom == .phone ? 15 : 30)
        .overlay(content: {
            if (access == false){
                VStack {
                    Image("lock_mods")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
                .frame(width: 120, height: 70, alignment: .topTrailing)
            }
        })
        .padding(.horizontal, 5)
    }
}
```

https://github.com/Yaroslav-Zagumennikov/Sub_SwiftUI/assets/91648112/5d3f9ddc-facc-45dc-9cf8-0485fa26ef14

Если при тестировании (например на симуляторе) подписка оплачивается но приложение не открывает следующий экран. Проверьте, чтобы в ваших проектах куда внедряете подписку в  в схему отладки был добавлен StoreKitConfig файл.


https://github.com/Yaroslav-Zagumennikov/Sub_SwiftUI/assets/91648112/32e6a2f5-32d1-4386-9225-5129d9286ac5







//
//  ContentView.swift
//  PackList_SwiftUI
//
//  Created by Akihiro Matsuyama on 2020/11/01.
//  Copyright © 2020 Akihiro Matsuyama. All rights reserved.
//

import SwiftUI

struct PackItem:Identifiable{
    var id:Int
    let name:String
    let image:Image
    let weight:String
    let comment:String
    let num:Int
}
struct SettingItem:Identifiable{
    var id:Int
    let name:String
}


struct ContentView: View {
    
    let settingList:[SettingItem] = [
        .init(id:0,name:"基本設定"),
        .init(id:1,name:"このアプリについて")
    ]
    
    let dataManager = DataManager.shared
    
    var body: some View {
        NavigationView{
            List{
                //第一セクション
                Section(header: Text("持ち物")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                ){
                    ForEach(dataManager.E1,id: \.self){ e1 in
                        NavigationLink(destination: PackDetail()){
                            HStack {
                                Image("icon")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width:50,height:50)
                                VStack{
                                    Text(e1["packName"]!)
                                        .font(.system(size: 25))
                                    HStack{
                                        //Text(pack[3])
                                        Text(e1["comment"]!)
                                    }
                                }
                            }
                        }
                    }
                    NavigationLink(destination: AddPackItem()){
                        Text(dataManager.mapType)
                        Text("新しいパックリスト")
                            .font(.headline)
                    }
                }
                    //セクションの大きさ
                    .frame(height: 40)
                
                //第二セクション
                Section(header: Text("設定")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                ) {
                    ForEach(self.settingList){setting in
                        VStack {
                            NavigationLink(destination: SettingDetail(setting: setting)){
                                Text(setting.name)
                                    .font(.headline)
                                    .padding()
                            }
                        }
                    }
                }
            }
                //リスト下
                .navigationBarTitle(Text("Top"))
        }
    }
}

//タップ後の詳細
struct PackDetail:View{
    let dM = DataManager.shared
    var body: some View{
        NavigationView{
            Form{
                Text("a")
            }
        }
        .navigationBarTitle(Text(dM.mapType), displayMode: .inline)
    }
}

struct SettingDetail:View{
    let setting: SettingItem
    
    var body: some View{
        NavigationView{
            if setting.name == "基本設定"{
                BasicConfig(setting: setting)
            }else if setting.name == "このアプリについて"{
                BasicApp()
            }else{
                ErrorCode()
            }
        }
        .navigationBarTitle(Text(setting.name), displayMode: .inline)
    }
}

struct AddPackItem:View {
    var body: some View{
        Text("w")
    }
}


struct BasicConfig:View{
    @State var value = false
    let setting: SettingItem
    
    var body: some View {
        Form {
            Toggle(isOn: $value) {
                VStack{
                    Text("在庫重量計")
                    Text("a")
                }
            }
            Toggle(isOn: $value) {
                VStack{
                    Text("必要重量計")
                    Text("a")
                }
            }
            Toggle(isOn: $value) {
                VStack{
                    Text("重量を四捨五入")
                    Text("a")
                }
            }
            Toggle(isOn: $value) {
                VStack{
                    Text("数量チェック制限")
                    Text("a")
                }
            }
            Toggle(isOn: $value) {
                VStack{
                    Text("メモ内も検索")
                    Text("a")
                }
            }
            .toggleStyle(SwitchToggleStyle())
        }
    }
}
struct BasicApp:View{
    var body: some View{
        Text("c")
    }
}

struct ErrorCode:View{
    var body: some View{
        Text("error:1")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

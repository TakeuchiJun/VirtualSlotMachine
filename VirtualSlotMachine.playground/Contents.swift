import UIKit

class VirtualSlotMachie {
    
    //変数・定数初期値
    var yourManey: Int = 0 //所持金
    let dict:[Int: Int] = [000: 2000 ,111: 2000, 222: 2000, 333: 3000, 444: 2000, 555: 2000, 666: 2000, 777: 15000, 888: 3000, 999: 2000, 123:1500, 234:1500, 345:1500, 456:1500, 567:1500, 678:1500, 789:1500, 987:1500, 876:1500, 765:1500, 654:1500, 543:1500, 432:1500, 321:1500] //あたり数字：配当金
    var winCounter:Int = 0  //当たり回数
    var slotNoInt: Int = 777 //スロット当たりNo代入用
    var playCounter: Int = 0 //スロットプレイ回数
    let lowerBetManey: Int = 100 // 最低掛金
    let upperBetManey: Int = 10000 //最高掛金
    
    init(yourManey: Int){
        self.yourManey = yourManey
    }
    //スロット処理（イレギュラー、３桁スロット、判定）
    func slotStart(){
        //プレイ回数計算(制限付き）、イレギュラー処理（端数返金）
        guard yourManey >= lowerBetManey, yourManey <= upperBetManey else {
            print("ようこそ。７７７スロットゲームへ！　本スロットは1プレイ100円です。100〜10000(円)内で投入して下さい。")
            print("返金額：\(yourManey)円")
            
            if yourManey > 10000 {
                print("遊びすぎには注意しましょう！")
            }
            return
        }
        
        playCounter = yourManey / 100 //プレイ回数
        let returnManey = yourManey % 100 //99円以下の端数はおつりで返金
        print("[ようこそ。７７７スロットゲームへ！　投入金額：\(yourManey)円　おつり：\(returnManey)円　プレイ回数：\(playCounter)回")
        yourManey = returnManey // おつりを所持金へ
        
        //プレイ開始
        for i in 1...playCounter {
            //スロットナンバー３桁生成
            var slotNoStr:String = ""
            for _ in 1...3 {
                slotNoStr += String(Int.random(in: 1...9))
            }
            slotNoInt = Int(slotNoStr)!
            //判定（当たり時は金額更新、当たり履歴取得）
            if dict.keys.contains(slotNoInt) { //スロットナンバーがdictの当たり番号に一致するものがあるか
                print("\(i)回目：\(slotNoInt)　当たり！(\(dict[slotNoInt]!) 円）")
                yourManey += dict[slotNoInt]! //所持金更新
                winCounter += 1 //当たり履歴代入
            } else { print("\(i)回目：\(slotNoInt)　ハズレ") }
        }
        print("当たり回数：\(winCounter)回　所持金：\(yourManey)")
    }
}

//１プレイ１００円で投入する金額を設定してスロットゲーム開始
let slot = VirtualSlotMachie(yourManey: 10001)
slot.slotStart()

//
//  ViewController.swift
//  Software_exp
//
//  Created by Shinto Higa on 2019/11/21.
//  Copyright © 2019 Shinto Higa. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    
    //選択肢をランダム配置するための変数と配列
    var swap_num:Int = 0
    var space:Int = 0
    var four:[Int] = [1,2,3,4]

    var choose_question = 0 //どの問題を出すかランダムで選ぶための変数
    var correct:Int = 0 //正解のボタンを判別するための変数
    var numQuestion:Int = 0 //今何問めか数えてくれる。
    var numClear:Int = 0 //何問正解したか数えてくれる。
    var before:Int = 100 //、同じ問題を連続して出さないために、問題文インデックス番号を保存し比較
    
    //[n]番目の問題文とその選択肢。正解は各選択肢配列の先頭に置いているとうまくいく。
    var question_sentences:[String] = ["問題文","question","あたりをつかみとれ！"]
    var choices_sentences:[[String]] = [["正解","選択肢1","選択肢2","選択肢3"],["CORRECT","choice1","choice2","choice3"],["あたり","ハズレ","大ハズレ","スカ"]]
    
    //選択肢をランダムに配置するためのInt:four[]をシャッフル
    func shuffle(){
        for i in 1...20{
            swap_num = Int.random(in: 0..<3)
            space=four[swap_num+1]
            four[swap_num+1]=four[swap_num]
            four[swap_num]=space
        }
    }
    
    //シャッフルした番号をも選択肢のインデックス番号とし、1番目のボタンから選択肢を配置
    func setting(){
        choose_question = Int.random(in:0..<question_sentences.count)
        if before == choose_question{
            setting()
        } else {
        question_text.text=String(question_sentences[choose_question])
        first.text = choices_sentences[choose_question][four[0]-1]
        second.text = choices_sentences[choose_question][four[1]-1]
        third.text = choices_sentences[choose_question][four[2]-1]
        fourth.text = choices_sentences[choose_question][four[3]-1]
        correct = four.firstIndex(of: 1)! //正解はfour[]の1が入っている場所を正解を判別する番号として保存
        before = choose_question //現在の問題のインデックス番号を保存し、連続で同じ問題を出させない
        }
    }
    
    //◯、×を表示している間、ボタンを押しても何もしないようにする
    func dont_touch(){
        ONE.isEnabled = false
        TWO.isEnabled = false
        THREE.isEnabled = false
        FOUR.isEnabled = false
    }
    
    //dont_touch()のあと、ボタンを押せるようにする
    func please_touch(){
        ONE.isEnabled = true
        TWO.isEnabled = true
        THREE.isEnabled = true
        FOUR.isEnabled = true
    }
    
    @IBOutlet weak var enemy: UIImageView! //敵の画像を貼る場所アウトレット
    @IBOutlet weak var question_text: UITextView! //問題文を貼るアウトレット
    
    //ボタン番号は左上、右上、左下、右下の順に1,2,3,4とする。
    //ボタンを押した後、そのボタン番号とcorrectが一致すれば◯を表示、そうでないなら×
    //回答の2秒後に次の問題に移る
    
    //左上ボタン
    @IBOutlet weak var ONE: UIButton!
    @IBAction func button_one(_ sender: Any) {
        if (correct == 0){
              playSound(name:"Quiz-Buzzer01-1")
            print("1:正解")
            let judgement = UIImage(named: "ok1105081")
            QuizJudge.image=judgement
        } else {
              playSound(name:"Quiz-Wrong_Buzzer02-2")
            print("Not 1,correct is", String(correct+1),":",String(choices_sentences[choose_question][0]))
            let judgement = UIImage(named: "Batsu")
            QuizJudge.image=judgement

        }
        self.dont_touch()
        DispatchQueue.main.asyncAfter(deadline : DispatchTime.now() + 2.0){
            self.please_touch()
            self.viewDidLoad()
        }
    }
    @IBOutlet weak var first: UILabel!
    
    //右上ボタン
    @IBOutlet weak var TWO: UIButton!
    @IBAction func button_two(_ sender: Any) {
        if (correct == 1){
              playSound(name:"Quiz-Buzzer01-1")
            print("2:正解")
            let judgement = UIImage(named: "ok1105081")
            QuizJudge.image=judgement
        } else {
            playSound(name:"Quiz-Wrong_Buzzer02-2")
            print("Not 2,correct is", String(correct+1),":",String(choices_sentences[choose_question][0]))
            let judgement = UIImage(named: "Batsu")
            QuizJudge.image=judgement

        }
        self.dont_touch()
        DispatchQueue.main.asyncAfter(deadline : DispatchTime.now() + 2.0){
            self.please_touch()
        self.viewDidLoad()
    }
}
    @IBOutlet weak var second: UILabel!
    
    //左下ボタン
    @IBOutlet weak var THREE: UIButton!
    @IBAction func button_three(_ sender: Any) {
        if (correct == 2){
              playSound(name:"Quiz-Buzzer01-1")
            print("3:正解")
            let judgement = UIImage(named: "ok1105081")
            QuizJudge.image=judgement
        } else {
            playSound(name:"Quiz-Wrong_Buzzer02-2")
            print("Not 3,correct is", String(correct+1),":",String(choices_sentences[choose_question][0]))
            let judgement = UIImage(named: "Batsu")
            QuizJudge.image=judgement

        }
        self.dont_touch()
        DispatchQueue.main.asyncAfter(deadline : DispatchTime.now() + 2.0){
            self.please_touch()
        self.viewDidLoad()
    }
}
    @IBOutlet weak var third: UILabel!
    
    //右下ボタン
    @IBOutlet weak var FOUR: UIButton!
    @IBAction func button_four(_ sender: Any) {
        if (correct == 3){
            playSound(name:"Quiz-Buzzer01-1")
            print("4:正解")
            let judgement = UIImage(named: "ok1105081")
            QuizJudge.image=judgement
        } else {
            playSound(name:"Quiz-Wrong_Buzzer02-2")
            print("Not 4,correct is", String(correct+1),":",String(choices_sentences[choose_question][0]))
            let judgement = UIImage(named: "Batsu")
            QuizJudge.image=judgement

        }
        self.dont_touch()
        DispatchQueue.main.asyncAfter(deadline : DispatchTime.now() + 2.0){
        self.please_touch()
        self.viewDidLoad()
        }
    }
    @IBOutlet weak var fourth: UILabel!
    
    @IBOutlet weak var QuizJudge: UIImageView! //丸ばつ画像のアウトレット
    
    @IBOutlet weak var numQuest: UILabel! //問題数を数えているアウトレット
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question_text.isUserInteractionEnabled = false //問題文の編集禁止
        question_text.isEditable = false
        let image = UIImage(named: "Enemy_image") //敵画像の挿入
        enemy.image=image
        self.QuizJudge.image=nil //丸ばつを表示した次の問題に遷移するとき、丸ばつ画像を消す
        shuffle()
        setting()
        numQuestion += 1
        print(numQuestion)
        numQuest.text = "問題"+String(numQuestion)
        // Do any additional setup after loading the view.
        
    }
}
    //音声ファイル
extension ViewController: AVAudioPlayerDelegate {
       func playSound(name: String) {
           guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
               print("音源ファイルが見つかりません")
               return
           }

           do {
               // AVAudioPlayerのインスタンス化
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

               // AVAudioPlayerのデリゲートをセット
               audioPlayer.delegate = self

               // 音声の再生
               audioPlayer.play()
           } catch {
           }
       }
}

//
//  ViewController2.swift
//  Test
//
//  Created by 津覇　翔也 on 2019/11/28.
//  Copyright © 2019 津覇　翔也. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImageView()
        // Do any additional setup after loading the view.
    }
    
    private func initImageView(){
        //UIImage インスタンスの生成
        let backgroundImage:UIImage = UIImage(named: "鉄板")!
        
        //UIImageView 初期化
        let imageView = UIImageView(image:backgroundImage)
        
        //スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        //画像の縦横サイズを取得
        let imgWidth:CGFloat = backgroundImage.size.width
        let imgHeight:CGFloat = backgroundImage.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        let scale:CGFloat = screenWidth / imgWidth
        let rect:CGRect =
            CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
        
        self.view.sendSubviewToBack(imageView)
        
        //self.view.backgroundColor = UIColor(patternImage:backgroundImage)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

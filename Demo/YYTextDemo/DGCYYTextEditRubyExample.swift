//
//  DGCYYTextEditRubyExample.swift
//  DGCYYTextDemo
//
//  Created by yin.yan on 2019/12/09.
//  Copyright © 2019 ibireme. All rights reserved.
//

import UIKit

@objc(DGCYYTextEditRubyExample)
@objcMembers
class DGCYYTextEditRubyExample: UIViewController {
    private lazy var dgc_textView: DGCYYTextView = {
        let dgc_textView = DGCYYTextView(frame: view.bounds)
        view.addSubview(dgc_textView)
        return dgc_textView
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let dgc_text = NSMutableAttributedString(string: "抗生物質などの薬を使いすぎると")
        // こうせいぶっしつ
        var dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "こう"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 0, length: 1))

        dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "せい"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 1, length: 1))

        dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "ぶっ"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 2, length: 1))

        dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "しつ"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 3, length: 1))
        // くすり
        dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "くすり"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 7, length: 1))
        // つか
        dgc_annotation = DGCYYTextRubyAnnotation()
        dgc_annotation.textBefore = "くすり"
        dgc_text.yy_setTextRubyAnnotation(dgc_annotation, range: NSRange(location: 9, length: 1))

        dgc_textView.attributedText = dgc_text
    }
}

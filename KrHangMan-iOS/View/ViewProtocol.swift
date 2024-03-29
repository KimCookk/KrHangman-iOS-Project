import Foundation

/*
 View 따르기 위한 protocol
*/

protocol ViewSetAble {
    // configureView : UI , View 에 관한 초기 설정
    func configureView()
    // configureEvent : View 에서 발생하는 Event 및 View 요소 Event 설정
    func configureEvent()
    // configureBind : ViewModel 데이터와 바인드 설정
    func configureBind()
}

protocol Page {
    func configurePage()
    func drawPage()
}

extension Page {
    func configurePage() {
        drawPage()
    }
}

protocol View {
    func configureView()
    func drawView()
}

extension View {
    func configureView() {
        drawView()
    }
}


protocol ViewAble {
    func configureView()
    func configureDraw()
    func configureEvent()
    
}

extension ViewAble {
    func configureView() {
        configureDraw()
        configureEvent()
    }
}

protocol ViewContolling {
    var viewModel: ViewModel? { get set }
    
    func configureController()
}

protocol ViewModel {
    
    var viewModelEventObservable: ObservableObject<ViewModelEvent> { get set}
}

protocol ViewModelEvent {
    
}

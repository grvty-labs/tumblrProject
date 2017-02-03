'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var App = function (_React$Component) {
  _inherits(App, _React$Component);

  function App() {
    _classCallCheck(this, App);

    return _possibleConstructorReturn(this, (App.__proto__ || Object.getPrototypeOf(App)).apply(this, arguments));
  }

  _createClass(App, [{
    key: 'render',
    value: function render() {
      return React.createElement(Modal, null);
    }
  }]);

  return App;
}(React.Component);

var Modal = function (_React$Component2) {
  _inherits(Modal, _React$Component2);

  function Modal(props) {
    _classCallCheck(this, Modal);

    var _this2 = _possibleConstructorReturn(this, (Modal.__proto__ || Object.getPrototypeOf(Modal)).call(this, props));

    _this2.state = {
      modalOpened: false
    };

    _this2.modalToggle = _this2.modalToggle.bind(_this2);
    return _this2;
  }

  _createClass(Modal, [{
    key: 'modalToggle',
    value: function modalToggle() {
      this.setState({ modalOpened: !this.state.modalOpened });
    }
  }, {
    key: 'render',
    value: function render() {
      var coverClass = this.state.modalOpened ? 'modal-cover modal-cover-active' : 'modal-cover';
      var containerClass = this.state.modalOpened ? 'modal-container modal-container-active' : 'modal-container';
      return React.createElement(
        'div',
        null,
        React.createElement(
          'button',
          { className: 'btn btn-primary', onClick: this.modalToggle },
          'Modal'
        ),
        React.createElement(
          'div',
          { className: containerClass },
          React.createElement('div', { className: 'modal-header' }),
          React.createElement('div', { className: 'modal-body' }),
          React.createElement('div', { className: 'modal-footer' })
        ),
        React.createElement('div', { className: coverClass, onClick: this.modalToggle })
      );
    }
  }]);

  return Modal;
}(React.Component);

ReactDOM.render(React.createElement(App, null), document.getElementById('app'));

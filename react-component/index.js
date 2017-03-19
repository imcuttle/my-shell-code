import React, {PropTypes, Component} from 'react';
import {Map} from 'immutable';
import autobind from 'autobind-decorator';
import css from './style.scss';

@autobind
class _Component_ extends Component {
    constructor(props) {
      super(props)
    }
    componentWillMount() {}
    componentDidMount() {}
    componentWillReceiveProps(newProps) {}
    shouldComponentUpdate(newProps, newState, newContext) {
        return !Map(this.props).equals(Map(newProps));
    }
    componentWillUpdate(newProps, newState, newContext) {}
    componentDidUpdate(oldProps, oldState, oldContext) {}
    componentWillUnmount() {}
    static defaultProps = {}
    state = {}
    static propTypes = {}
    render() {
      const {...props} = this.props

      return (
          <div className={css.main}></div>
      )
    }
}

export default _Component_;
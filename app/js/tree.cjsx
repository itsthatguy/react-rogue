React = require('react')

TreeNode = React.createClass({
  getInitialState: ->
    isRoot = this._mountDepth == 0
    return {unlocked: isRoot, visible: false}


  render: ->
    console.log this.state
    className = "item no-children"

    hasChildren = this.props.node.childNodes?

    if hasChildren
      childNodes = this.props.node.childNodes.map (node, index) ->
        return (<li key={index}><TreeNode node={node} /></li>)

      className = "item has-children"
      if (this.state.visible)
        className += " open"
      else
        className += " closed"


    style = {}
    if (!this.state.visible)
      style.display = "none"

    return (
      <div className="upgrade">
        <div onClick={this.toggle} className={className}>
          {this.props.node.title}
          <span className="max-levels">{this.props.node.maxLevels}</span>
        </div>
        <ul style={style}>
          {childNodes}
        </ul>
      </div>
    )

  toggle: ->
    this.setState({visible: !this.state.visible})

  unlock: ->
    this.setState({unlocked: !this.state.unlocked})

})

tree =
  {title: "Smithy", maxLevels: 1, childNodes: [
    {title: "Health Up", maxLevels: 1, childNodes: [
      {title: "Paladin Upgrade", maxLevels: 1, childNodes: [
        {title: "Equip Up", maxLevels: 50, childNodes: [
          {title: "Enchantress", maxLevels: 1, childNodes: [
            {title: "Magic Damage Up", maxLevels: 75}
              {title: "Archmage Upgrade", maxLevels: 1, childNodes: [
                {title: "Miner Unlock", maxLevels: 1, childNodes: [
                  {title: "Assassin Upgrade", maxLevels: 1, childNodes: [
                    {title: "Potion Up", maxLevels: 5, childNodes: [
                      {title: "Spellthief Unlock", maxLevels: 1, childNodes: [
                        {title: "Spellsword Upgrade", maxLevels: 1, childNodes: [
                          {title: "Mana Cost Down", maxLevels: 5, childNodes: [
                            {title: "Randomize Children", maxLevels: 1}
                          ]}
                          {title: "Invul Time Upgrade", maxLevels: 5, childNodes: [
                            {title: "Bestiality", maxLevels: 1}
                          ]}
                        ]}
                      ]}
                    ]}
                  ]}
                  {title: "Spelunker Upgrade", maxLevels: 1}
                  {title: "Gold Gain Up", maxLevels: 5}
                ]}
              ]}
          ]}
            {title: "Architect", maxLevels: 1, childNodes: [
              {title: "Attack Up", maxLevels: 50}
              {title: "Barbarian King Upgrade", maxLevels: 1, childNodes: [
                {title: "Shinobi Unlock", maxLevels: 1, childNodes: [
                  {title: "Crit Chance Up", maxLevels: 25, childNodes: [
                    {title: "Crit Damage Up", maxLevels: 25}
                  ]}
                  {title: "Haggle", maxLevels: 5, childNodes: [
                    {title: "Lich Unlock", maxLevels: 1, childNodes: [
                      {title: "Lich King Upgrade", maxLevels: 1}
                    ]}
                    {title: "Hokage Upgrade", maxLevels: 1, childNodes: [
                      {title: "Armor Up", maxLevels: 50}
                      {title: "Down Strike Up", maxLevels: 5}
                    ]}
                  ]}
                ]}
              ]}
            ]}
        ]}
      ]}
    ]}
  ]}


React.render(
  <TreeNode node={tree} />,
  document.getElementById("tree")
)


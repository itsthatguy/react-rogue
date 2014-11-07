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
  {title: "Smithy", childNodes: [
    {title: "Health Up", childNodes: [
      {title: "Paladin Upgrade", childNodes: [
        {title: "Equip Up", childNodes: [
          {title: "Enchantress", childNodes: [
            {title: "Magic Damage Up"}
              {title: "Archmage Upgrade", childNodes: [
                {title: "Miner Unlock", childNodes: [
                  {title: "Assassin Upgrade", childNodes: [
                    {title: "Potion Up", childNodes: [
                      {title: "Spellthief Unlock", childNodes: [
                        {title: "Spellsword Upgrade", childNodes: [
                          {title: "Mana Cost Down", childNodes: [
                            {title: "Randomize Children"}
                          ]}
                          {title: "Invul Time Upgrade", childNodes: [
                            {title: "Bestiality"}
                          ]}
                        ]}
                      ]}
                    ]}
                  ]}
                  {title: "Spelunker Upgrade"}
                  {title: "Gold Gain Up"}
                ]}
              ]}
          ]}
            {title: "Architect", childNodes: [
              {title: "Attack Up"}
              {title: "Barbarian King Upgrade", childNodes: [
                {title: "Shinobi Unlock", childNodes: [
                  {title: "Crit Chance Up", childNodes: [
                    {title: "Crit Damage Up"}
                  ]}
                  {title: "Haggle", childNodes: [
                    {title: "Lich Unlock", childNodes: [
                      {title: "Lich King Upgrade"}
                    ]}
                    {title: "Haggle Upgrade", childNodes: [
                      {title: "Armor Up"}
                      {title: "Down Strike Up"}
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


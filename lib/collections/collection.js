Collection = new Meteor.Collection( 'collection' );

Collection.allow({
  insert: () => true,
  update: () => true,
  remove: () => true
});

Collection.deny({
  insert: () => false,
  update: () => false,
  remove: () => false
});

let CollectionSchema = new SimpleSchema({
  "owner": {
    type: String,
    label: "The ID of the owner of this document."
  }
});

Collection.attachSchema( CollectionSchema );

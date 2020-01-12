class EdgeMediaToCaption {
  List<Edges> edges;

  EdgeMediaToCaption({this.edges});

  EdgeMediaToCaption.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EdgeFollowedBy {
  int count;

  EdgeFollowedBy({this.count});

  EdgeFollowedBy.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Dimensions {
  int height;
  int width;

  Dimensions({this.height, this.width});

  Dimensions.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}

class Owner {
  String id;
  String username;

  Owner({this.id, this.username});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}

class ThumbnailResources {
  String src;
  int configWidth;
  int configHeight;

  ThumbnailResources({this.src, this.configWidth, this.configHeight});

  ThumbnailResources.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    configWidth = json['config_width'];
    configHeight = json['config_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['config_width'] = this.configWidth;
    data['config_height'] = this.configHeight;
    return data;
  }
}

class Node {
  String sTypename;
  String id;
  EdgeMediaToCaption edgeMediaToCaption;
  String shortcode;
  EdgeFollowedBy edgeMediaToComment;
  bool commentsDisabled;
  int takenAtTimestamp;
  Dimensions dimensions;
  String displayUrl;
  EdgeFollowedBy edgeLikedBy;
  EdgeFollowedBy edgeMediaPreviewLike;
  Null location;
  Null gatingInfo;
  Null factCheckOverallRating;
  Null factCheckInformation;
  String mediaPreview;
  Owner owner;
  String thumbnailSrc;
  List<ThumbnailResources> thumbnailResources;
  bool isVideo;
  String accessibilityCaption;

  Node(
      {this.sTypename,
      this.id,
      this.edgeMediaToCaption,
      this.shortcode,
      this.edgeMediaToComment,
      this.commentsDisabled,
      this.takenAtTimestamp,
      this.dimensions,
      this.displayUrl,
      this.edgeLikedBy,
      this.edgeMediaPreviewLike,
      this.location,
      this.gatingInfo,
      this.factCheckOverallRating,
      this.factCheckInformation,
      this.mediaPreview,
      this.owner,
      this.thumbnailSrc,
      this.thumbnailResources,
      this.isVideo,
      this.accessibilityCaption});

  Node.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    id = json['id'];
    edgeMediaToCaption = json['edge_media_to_caption'] != null
        ? new EdgeMediaToCaption.fromJson(json['edge_media_to_caption'])
        : null;
    shortcode = json['shortcode'];
    edgeMediaToComment = json['edge_media_to_comment'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_media_to_comment'])
        : null;
    commentsDisabled = json['comments_disabled'];
    takenAtTimestamp = json['taken_at_timestamp'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    displayUrl = json['display_url'];
    edgeLikedBy = json['edge_liked_by'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_liked_by'])
        : null;
    edgeMediaPreviewLike = json['edge_media_preview_like'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_media_preview_like'])
        : null;
    location = json['location'];
    gatingInfo = json['gating_info'];
    factCheckOverallRating = json['fact_check_overall_rating'];
    factCheckInformation = json['fact_check_information'];
    mediaPreview = json['media_preview'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    thumbnailSrc = json['thumbnail_src'];
    if (json['thumbnail_resources'] != null) {
      thumbnailResources = new List<ThumbnailResources>();
      json['thumbnail_resources'].forEach((v) {
        thumbnailResources.add(new ThumbnailResources.fromJson(v));
      });
    }
    isVideo = json['is_video'];
    accessibilityCaption = json['accessibility_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['id'] = this.id;
    if (this.edgeMediaToCaption != null) {
      data['edge_media_to_caption'] = this.edgeMediaToCaption.toJson();
    }
    data['shortcode'] = this.shortcode;
    if (this.edgeMediaToComment != null) {
      data['edge_media_to_comment'] = this.edgeMediaToComment.toJson();
    }
    data['comments_disabled'] = this.commentsDisabled;
    data['taken_at_timestamp'] = this.takenAtTimestamp;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions.toJson();
    }
    data['display_url'] = this.displayUrl;
    if (this.edgeLikedBy != null) {
      data['edge_liked_by'] = this.edgeLikedBy.toJson();
    }
    if (this.edgeMediaPreviewLike != null) {
      data['edge_media_preview_like'] = this.edgeMediaPreviewLike.toJson();
    }
    data['location'] = this.location;
    data['gating_info'] = this.gatingInfo;
    data['fact_check_overall_rating'] = this.factCheckOverallRating;
    data['fact_check_information'] = this.factCheckInformation;
    data['media_preview'] = this.mediaPreview;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['thumbnail_src'] = this.thumbnailSrc;
    if (this.thumbnailResources != null) {
      data['thumbnail_resources'] =
          this.thumbnailResources.map((v) => v.toJson()).toList();
    }
    data['is_video'] = this.isVideo;
    data['accessibility_caption'] = this.accessibilityCaption;
    return data;
  }
}

class Edges {
  Node node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class EdgeOwnerToTimelineMedia {
  int count;
  PageInfo pageInfo;
  List<Edges> edges;

  EdgeOwnerToTimelineMedia({this.count, this.pageInfo, this.edges});

  EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo.toJson();
    }
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageInfo {
  bool hasPreviousPage;
  String startCursor;
  String endCursor;
  bool hasNextPage;

  PageInfo(
      {this.hasPreviousPage,
      this.startCursor,
      this.endCursor,
      this.hasNextPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    hasPreviousPage = json['has_previous_page'];
    startCursor = json['start_cursor'];
    endCursor = json['end_cursor'];
    hasNextPage = json['has_next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_previous_page'] = this.hasPreviousPage;
    data['start_cursor'] = this.startCursor;
    data['end_cursor'] = this.endCursor;
    data['has_next_page'] = this.hasNextPage;
    return data;
  }
}

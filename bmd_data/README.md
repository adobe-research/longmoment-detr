# Behance Moment Detection (BMD) Dataset

The Behance Moment Detection (BMD) dataset is curated for the task of moment detection in long tutorial videos.

## Data Splits

- **Evaluation Splits**: The `val.json` and `test.json` splits have been manually annotated.
  
- **Training Split**: This contains automatic annotations.

## Automatic Annotation Procedure

1. **Video Segmentation**: Videos are initially divided into segments using the tool available at [ivi-ru/video-scene-detection](https://github.com/ivi-ru/video-scene-detection).
   
2. **Summarization**: For every video segment, a Large Language Model (LLM) - specifically GPT-3 - is used to produce a summarization derived from the transcript of that segment.

## Additional Annotations

- **Alternative LLMs**: Annotations produced using different LLMs are housed in the `different_llms_query_generation/` directory or file.

## Video Links Association

To correlate the `video_id` from the annotations with the actual video link, you can refer to the `bmd_links.jsonl` file.

## Transcripts for Training Split

For those interested in the raw transcripts from which the annotations in the training split were derived, the transcripts can be accessed at the following link:
[Training Split Transcripts](https://archive.org/download/bmd_weights/transcripts_bmd.jsonl)

## Annotation File Structure

The dataset annotations (including the transcript) are formatted in the `jsonl` (JSON Lines) format. Each line in the annotation file is a standalone JSON object, detailing a specific moment in a video.

Here's an example of how the annotations look:

```json
{"qid": 3978, "query": "the host starts the stream with the face cam on and greets the viewers. and talks about the random topics and shares the screen with a car image on the canvas. and sets off to get started with the sketch.", "vid": "06175b95-ae49-4ae8-9b6e-532d2e2f8789", "relevant_windows": [[0, 657]]}
```

### Attributes:

- **qid**: The unique query identifier.
- **query**: The actual query described in natural language, summarizing the video segment's content.
- **vid**: The video identifier, which can be used to reference the specific video.
- **duration**: Duration of the whole video in seconds.
- **relevant_windows**: An array containing the start and end times (in seconds) of the relevant video segment for the described query.

## Weights

Since publishing our dataset, certain videos have become unavailable. Consequently, we have retrained our model, and you can access the updated weights [here](https://archive.org/download/bmd_weights/bmd_recent.tar.gz). If you are interested in the original weights, trained using the complete video set, they are available [here](https://archive.org/download/bmd_weights/weights_original.tar.gz).

## Videos

We've released the videos for this dataset. Each tar.gz file from the collection contains frames extracted at 1 fps from a single video.

Additional metadata for the Behance videos can be found [here](https://archive.org/download/bmd_weights/behance_videos_metadata.tar.gz). It contains: video name, video description and the video creator name.

You can download the videos from the following links: 

[Part 1](https://archive.org/details/bmd_videos)

[Part_2](https://archive.org/details/bmd_videos_part2)

To download the videos programmatically, install the ```internetarchive``` package

```bash
pip install internetarchive
```

To inspect the contents of these collections, use:

```bash
ia metadata bmd_videos
ia metadata bmd_videos_part2
```

To download all the videos, use:

```bash
ia download bmd_videos
ia download bmd_videos_part2
```

Alternatively, each video can be downloaded independently, using:

```bash
ia download bmd_videos {video_id}.tar.gz
```

### Extract videos
When you unzip a video, it will directly extract all frames into the current working directory. To organize the frames, you may prefer to create a separate directory for each video. You can do so by using the following commands:
```bash
mkdir {video_id}
tar -xzvf {video_id}.tar.gz -C {video_id}
```

If you prefer to convert the .tar.gz file to a .tar file, use the following command:

```bash
gunzip {video_id}.tar.gz
```

## Features

We provide the [Slowfast features and GPT2 features](https://archive.org/details/bmd_features). 

To download the features programmatically, use:

```bash
pip install internetarchive
ia download bmd_features
```


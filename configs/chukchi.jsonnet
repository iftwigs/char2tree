{
  "dataset_reader": {
    "type": "ud_reader"
  },
  "train_data_path": "data/Chukchi/flat_train/ckt_hse-ud-train.00.conllu",
  "validation_data_path": "data/Chukchi/flat_test/ckt_hse-ud-test.00.conllu",
  "vocabulary": {
    "non_padded_namespaces": ["*tags", "*labels", "upos", "dependency"]
  },
  "model": {
    "type": "joint_tagger_parser",
    "text_field_embedder": {
      "token_embedders": {
        "tokens": {
          "type": "embedding",
          "embedding_dim": 30,
          "trainable": true
        }
      }
    },
    "encoder": {
      "type": "stacked_bidirectional_lstm",
      "input_size": 30,
      "hidden_size": 128,
      "num_layers": 2,
      "recurrent_dropout_probability": 0.25,
      "layer_dropout_probability": 0.25,
      "use_highway": true
    },
    "upos_hidden": 64,
    "arc_mlp_size": 128,
    "label_mlp_size": 64,
    "embedding_dropout": 0.33,
    "encoded_dropout": 0.25,
    "upos_dropout": 0.25,
    "mlp_dropout": 0.25
  },
  "iterator": {
    "type": "bucket",
    "batch_size": 8,
    "biggest_batch_first": true,
    "sorting_keys": [["tokens", "num_tokens"]]
  },
  "trainer": {
    "optimizer": {
      "type": "adam",
      "lr": 4e-3,
      "weight_decay": 1e-4
    },
    "learning_rate_scheduler": {
      "type": "reduce_on_plateau",
      "factor": 0.5,
      "patience": 5,
      "min_lr": 1e-5
    },
    "num_epochs": 100,
    "patience": 20,
    "grad_norm": 5.0,
    "cuda_device": 0
  }
}